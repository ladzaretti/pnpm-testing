import React from 'react';
import classes from 'classnames';
import style from '../base.module.sass';

export const Arrow = React.forwardRef<
	HTMLDivElement,
	JSX.IntrinsicElements['div']
>(({ className, ...props }, ref) => (
	<div className={classes(style.Arrow, className)} {...{ ...props, ref }}>
		<svg viewBox="0 0 100 100" preserveAspectRatio="none">
			<defs>
				<marker
					id="arrow"
					markerWidth="10"
					markerHeight="10"
					refX="0"
					refY="3"
					orient="auto"
					markerUnits="strokewidth"
				>
					<path d="m0,0 l0,6 l9,3 z" style={{ fill: 'var(--fgc)' }} />
				</marker>
			</defs>
			<path
				className={style.lightOnly}
				d="M0,50L90,50"
				marker-end="url(#arrow)"
				vectorEffect="non-scaling-stroke"
			/>
			<path
				className={style.darkOnly}
				d="M0,0L20,100L40,0L40,100L50,0L60,100L70,0L80,100L90,0L100,100"
				vectorEffect="non-scaling-stroke"
			/>
		</svg>
	</div>
));
