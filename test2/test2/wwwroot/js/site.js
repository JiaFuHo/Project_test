//header
$(".link").on("click", () => { if ($(".navbar-toggler").is(":visible")) { $(".navbar-toggler").trigger("click") } })

//footer
chkSize = () => {
    let x = $(document).width();

    if (x <= 768) { $(".box_info").addClass("d-none"); }
    else { $(".box_info").removeClass("d-none"); }
}

$(() => { chkSize() })

$(window).on("resize", () => { chkSize() })