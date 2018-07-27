$( function() {
    $(document).on("click", "a.show , button.delete , button.cancel", function() {
        $("div.modal").toggleClass("is-active");
    });
});

