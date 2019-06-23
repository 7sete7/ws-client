import { useState } from 'react'

useField = (initialValue) -> 
	[value, setValue] = useState(initialValue)

	onChange = ({ target: { value: newValue } }) -> 
		setValue(newValue)

	return {
		value,
		setValue,
		onChange,
	}


export useCheckbox = (initialValue) -> 
	[checked, setValue] = useState(initialValue)

	onChange = ({ target: { checked: newValue } }) -> 
		setValue(newValue)

	return {
		checked,
		setValue,
		onChange,
	}

export default useField;
