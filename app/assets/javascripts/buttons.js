$( function() {
    $(document).on("click", "a#cart-empty , button#empty-cart-cancel, button#cart-delete", function() {
        $("div#empty-modal").toggleClass("is-active");
    });

    $(document).on("click", "a#cart-pay , button#pay-cart-cancel, button#pay-delete", function() {
        $("div#pay-modal").toggleClass("is-active");
        $("a#gmap").addClass("in-active");
        $("div#delivery-msg").html("Share your location as delivery address");
        $("a#pay-ctrl").attr("disabled", true);
        $("a#pay-ctrl").attr("href", "javascript:void(0)");
    });

    $(document).on("click", "a#item-delete , button#item-delete, button#item-delete-x", function() {
        $("div#item-delete").toggleClass("is-active");
    });

    $(document).on("click", "a#acc-delete , button#acc-delete, button#acc-delete-x", function() {
        $("div#acc-delete").toggleClass("is-active");
    });

    $(document).on("click", "button#dev-dismiss", function() {
        $("span#dev-error").remove();
    });

    $(document).on("click", "a#search-box, button#search-dismiss", function() {
        $("section#hero-search").toggleClass("in-active");
        $("section#hero-add").toggleClass("in-active");
    });

    $(document).on("click", "a.item-cancel , button.item-cancel, button.item-delete", function() {
    	str = $(this).attr('id');
        $("div#"+str).toggleClass("is-active");
    });
});

