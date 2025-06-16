chkSize = () => {
    let x = $(document).width();

    if (x <= 768) { $(".box_info").addClass("d-none"); }
    else { $(".box_info").removeClass("d-none"); }
}

$(() => { chkSize() })

$(window).on("resize", () => { chkSize() })

$("#btn_search")
    .on("click", () => { $("#box_search").css("display", "inline") })
    .on("keypress", (e) => {
        if (e.key === "Enter") {
            let x = $("#box_search").val();

            $("#box_submit").val(x).trigger("click");
            $("#box_search").css("display", "none").val(null);

            if ($(".navbar-toggler").is(":visible")) { $(".navbar-toggler").trigger("click") }
        }
    })

$(".link").on("click", () => { if ($(".navbar-toggler").is(":visible")) { $(".navbar-toggler").trigger("click") } })