import React from 'react';
import style from './SliderCheckbox.module.css';

type InputProps = React.DetailedHTMLProps<
	React.InputHTMLAttributes<HTMLInputElement>,
	HTMLInputElement
>;

export interface SliderCheckboxProps extends InputProps {
	onCaption?: string;
	offCaption?: string;
}

let id = 0;
const getId = () => id++;

export const SliderCheckbox: React.FC = ({ ...props }) => {
	const uniqueId = React.useMemo(() => getId(), []);
	const id = `slider-checkbox-${uniqueId}`;
	return (
		<label htmlFor={id} className={style.label}>
			<input id={id} className={style.input} type="checkbox" {...props} />

			<div className={style.slider}>
				<div className={style.sliderDot} />
			</div>
		</label>
	);
};

export default SliderCheckbox;
