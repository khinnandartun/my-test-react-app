import TextField from '@mui/material/TextField';
import Autocomplete from '@mui/material/Autocomplete';
import './Autocomplete.css';


function AutocompleteBox(props) {
    const { items, label, id, changedInputValue, changedValue } = props;
    const handleInputChange = (e, values) => {
        changedInputValue(values);
    }
    const handleChange = (e, values) => {
        changedValue(values);
    }
    return (
        <Autocomplete
            onChange={handleChange}
            onInputChange={handleInputChange}
            disablePortal
            id={id}
            options={items}
            sx={{ width: 300 }}
            renderInput={(params) => <TextField {...params} label={label} />}
        />
    );
}
export default AutocompleteBox;