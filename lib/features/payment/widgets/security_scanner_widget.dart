import 'dart:math' as math;
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:payment_portal/core/config/app_config.dart';

/// Radar-style security scanning animation.
///
/// Architecture for 60/120 fps without tree-wide repaints:
///   • [RepaintBoundary] promotes the canvas to its own compositing layer;
///     only this layer is rasterised on each animation tick.
///   • The [CustomPainter] is constructed once per [build] call (rare) and
///     uses `repaint: animation` so [RenderCustomPaint] listens directly to
///     the ticker — no [AnimatedBuilder] / [setState] dirtying the tree.
///   • [Paint] objects are instance fields of the painter, allocated once
///     and mutated in place each frame (no per-frame heap allocations).
class SecurityScannerWidget extends StatefulWidget {
  const SecurityScannerWidget({super.key, this.size = 180.0, this.primaryColor});

  final double size;
  final Color? primaryColor;

  @override
  State<SecurityScannerWidget> createState() => _SecurityScannerWidgetState();
}

class _SecurityScannerWidgetState extends State<SecurityScannerWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  // Deterministic blip positions — static so all instances share the same set.
  static final List<_BlipData> _blips = _generateBlips();
  static List<_BlipData> _generateBlips() {
    final rng = math.Random(0xCAFE);
    return List.generate(
      14,
      (_) => _BlipData(
        angle: rng.nextDouble() * 2 * math.pi,
        radiusFraction: 0.18 + rng.nextDouble() * 0.68,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2400),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.primaryColor ?? Theme.of(context).colorScheme.primary;
    return RepaintBoundary(
      child: SizedBox.square(
        dimension: widget.size,
        child: CustomPaint(
          painter: _SecurityScannerPainter(
            animation: _controller,
            primaryColor: color,
            blips: _blips,
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------

class _BlipData {
  const _BlipData({required this.angle, required this.radiusFraction});
  final double angle; // polar angle in radians, 0 → 2π
  final double radiusFraction; // 0 → 1, fraction of radar radius
}

// ---------------------------------------------------------------------------

class _SecurityScannerPainter extends CustomPainter {
  _SecurityScannerPainter({
    required this.animation,
    required this.primaryColor,
    required this.blips,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final Color primaryColor;
  final List<_BlipData> blips;

  // Pre-allocated — mutated in place each frame, never re-created per tick.
  final _ringPaint = Paint()
    ..style = PaintingStyle.stroke
    ..isAntiAlias = true;
  final _fillPaint = Paint()
    ..style = PaintingStyle.fill
    ..isAntiAlias = true;
  final _strokePaint = Paint()
    ..style = PaintingStyle.stroke
    ..isAntiAlias = true;
  final _sectorPaint = Paint()
    ..style = PaintingStyle.fill
    ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Size size) {
    final t = animation.value; // 0.0 → 1.0 per revolution
    final cx = size.width / 2;
    final cy = size.height / 2;
    final R = math.min(cx, cy) * 0.92;

    // Sweep origin: 12 o'clock (−π/2), rotating clockwise.
    final sweepAngle = t * 2 * math.pi - math.pi / 2;

    // All drawing clipped to the circular radar boundary.
    canvas.save();
    canvas.clipPath(
      Path()..addOval(Rect.fromCircle(center: Offset(cx, cy), radius: R)),
    );

    _paintGrid(canvas, cx, cy, R);
    _paintRings(canvas, cx, cy, R, t);
    _paintSweepSector(canvas, cx, cy, R, sweepAngle);
    _paintSineOverlay(canvas, cx, cy, R, t);
    _paintBlips(canvas, cx, cy, R, sweepAngle);
    _paintScanLine(canvas, cx, cy, R, sweepAngle);

    canvas.restore();

    // Border and center dot drawn outside the clip so they are never cropped.
    _paintBorderAndCenter(canvas, cx, cy, R);
  }

  // ── Grid ──────────────────────────────────────────────────────────────────

  void _paintGrid(Canvas canvas, double cx, double cy, double R) {
    _strokePaint
      ..color = primaryColor.withValues(alpha: 0.12)
      ..strokeWidth = 0.5;
    for (int i = 0; i < 4; i++) {
      final a = i * math.pi / 4;
      final cosA = math.cos(a);
      final sinA = math.sin(a);
      canvas.drawLine(
        Offset(cx - R * cosA, cy - R * sinA),
        Offset(cx + R * cosA, cy + R * sinA),
        _strokePaint,
      );
    }
  }

  // ── Pulsating concentric rings ────────────────────────────────────────────

  void _paintRings(Canvas canvas, double cx, double cy, double R, double t) {
    _ringPaint.strokeWidth = 0.8;
    for (int i = 1; i <= 4; i++) {
      // Each ring oscillates at a staggered phase so the pulse cascades outward.
      final phase = 2 * math.pi * t * 1.6 + (i - 1) * (math.pi / 2);
      final alpha = 0.16 + 0.14 * math.sin(phase);
      _ringPaint.color = primaryColor.withValues(alpha: alpha);
      canvas.drawCircle(Offset(cx, cy), R * i / 4, _ringPaint);
    }
  }

  // ── Sweep sector with angular gradient trail ──────────────────────────────

  void _paintSweepSector(
    Canvas canvas,
    double cx,
    double cy,
    double R,
    double sweepAngle,
  ) {
    const trailSpan = math.pi * 0.72; // ~130° fading wake

    // SweepGradient rotates from transparent at the trailing edge to solid at
    // the leading scan line — gives a radar "wake" effect.
    _sectorPaint.shader = ui.Gradient.sweep(
      Offset(cx, cy),
      [
        Colors.transparent,
        primaryColor.withValues(alpha: 0.06),
        primaryColor.withValues(alpha: 0.28),
      ],
      [0.0, 0.45, 1.0],
      ui.TileMode.clamp,
      sweepAngle - trailSpan,
      sweepAngle,
    );

    canvas.drawArc(
      Rect.fromCircle(center: Offset(cx, cy), radius: R),
      sweepAngle - trailSpan,
      trailSpan,
      true, // pie-slice shape so gradient fills from centre
      _sectorPaint,
    );
    _sectorPaint.shader = null;
  }

  // ── Flowing sine-wave overlay ─────────────────────────────────────────────

  void _paintSineOverlay(
    Canvas canvas,
    double cx,
    double cy,
    double R,
    double t,
  ) {
    const amplitude = 5.5;
    const frequency = 3.0;
    final waveY = cy + R * 0.62;
    final halfW = R * 0.72;
    final left = cx - halfW;
    final steps = (halfW * 2).ceil();

    final path = Path();
    for (int px = 0; px <= steps; px++) {
      final x = left + px.toDouble();
      final normX = px / steps; // 0 → 1 across wave width
      // Phase advances with time: wave flows rightward as t increases.
      final y =
          waveY +
          amplitude *
              math.sin(2 * math.pi * (frequency * normX - t * 2.8));
      if (px == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    // Horizontal linear gradient fades the wave at both edges.
    _strokePaint
      ..shader = ui.Gradient.linear(
        Offset(left, waveY),
        Offset(left + halfW * 2, waveY),
        [
          Colors.transparent,
          primaryColor.withValues(alpha: 0.52),
          primaryColor.withValues(alpha: 0.52),
          Colors.transparent,
        ],
        [0.0, 0.14, 0.86, 1.0],
      )
      ..strokeWidth = 1.4
      ..strokeCap = StrokeCap.round;
    canvas.drawPath(path, _strokePaint);
    _strokePaint.shader = null;
  }

  // ── Blip targets ──────────────────────────────────────────────────────────

  void _paintBlips(
    Canvas canvas,
    double cx,
    double cy,
    double R,
    double sweepAngle,
  ) {
    // Blips are visible within ~108° behind the sweep, fading as they age.
    const visibleArc = math.pi * 0.6;
    for (final blip in blips) {
      final blipAngle = blip.angle - math.pi / 2; // align to top-start origin
      double delta = (sweepAngle - blipAngle) % (2 * math.pi);
      if (delta < 0) delta += 2 * math.pi;
      if (delta > visibleArc) continue;

      final brightness = 1.0 - (delta / visibleArc);
      final r = R * blip.radiusFraction;
      final bx = cx + r * math.cos(blipAngle);
      final by = cy + r * math.sin(blipAngle);

      _fillPaint.color = primaryColor.withValues(alpha: brightness * 0.28);
      canvas.drawCircle(Offset(bx, by), 5.5, _fillPaint); // outer glow
      _fillPaint.color = primaryColor.withValues(alpha: brightness * 0.92);
      canvas.drawCircle(Offset(bx, by), 2.2, _fillPaint); // inner dot
    }
  }

  // ── Leading scan line ─────────────────────────────────────────────────────

  void _paintScanLine(
    Canvas canvas,
    double cx,
    double cy,
    double R,
    double sweepAngle,
  ) {
    final ex = cx + R * math.cos(sweepAngle);
    final ey = cy + R * math.sin(sweepAngle);

    // Linear gradient from transparent at the centre to full colour at the edge
    // creates a bright, tapering leading edge.
    _strokePaint
      ..shader = ui.Gradient.linear(
        Offset(cx, cy),
        Offset(ex, ey),
        [
          primaryColor.withValues(alpha: 0.0),
          primaryColor.withValues(alpha: 1.0),
        ],
      )
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(Offset(cx, cy), Offset(ex, ey), _strokePaint);
    _strokePaint.shader = null;
  }

  // ── Outer border + centre origin dot ─────────────────────────────────────

  void _paintBorderAndCenter(Canvas canvas, double cx, double cy, double R) {
    _ringPaint
      ..color = primaryColor.withValues(alpha: 0.38)
      ..strokeWidth = 1.2;
    canvas.drawCircle(Offset(cx, cy), R, _ringPaint);

    _fillPaint.color = primaryColor.withValues(alpha: 0.95);
    canvas.drawCircle(Offset(cx, cy), 3.5, _fillPaint);
  }

  // Only repaint when primaryColor changes — animation ticks are handled by
  // the `repaint: animation` listenable registered in the constructor.
  @override
  bool shouldRepaint(_SecurityScannerPainter old) =>
      old.primaryColor != primaryColor;
}

// ---------------------------------------------------------------------------
// Presentational card wrapper
// ---------------------------------------------------------------------------

/// Displays [SecurityScannerWidget] with a status label, styled to match
/// [AppBrandConfig] so it fits both retail and utility themes.
class SecurityScanningCard extends StatelessWidget {
  const SecurityScanningCard({
    super.key,
    required this.label,
    this.scannerSize = 148.0,
  });

  final String label;
  final double scannerSize;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final config = AppBrandConfig.of(context);
    final color = theme.colorScheme.primary;

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: config.cardRadius,
        border: Border.all(color: color.withValues(alpha: 0.18)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SecurityScannerWidget(size: scannerSize, primaryColor: color),
          const SizedBox(height: 12),
          Text(
            label,
            style: theme.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.onSurfaceVariant,
              letterSpacing: 0.4,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
