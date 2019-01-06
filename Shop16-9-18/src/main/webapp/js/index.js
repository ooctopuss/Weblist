$(function () {
    $("#autocomplete-2").select2({
        placeholder: "Seleziona un prodotto",
        allowClear: true
    });
    $("#autocomplete-2").val(null).trigger("change");
});
