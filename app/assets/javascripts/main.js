$(document).on("turbolinks:load", initializeComponents);
$(document).ready(initializeComponents);


function initializeComponents(){
    $(".select2-dropdown").select2({
        theme: "bootstrap",
        width: '100%'
    });
}