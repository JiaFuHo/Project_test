//header
$(".link").on("click", () => { if ($(".navbar-toggler").is(":visible")) { $(".navbar-toggler").trigger("click") } })

//modal
$("#btn_search2").on("click", () => { $("#box_modal2").removeClass("d-none"); $("#box_modal1").addClass("d-none") })
$("#btn_search4").on("click", () => { $("#box_modal1").removeClass("d-none"); $("#box_modal2").addClass("d-none") })

//footer
chkSize = () => {
    let x = $(document).width();

    if (x <= 768) { $(".box_info").addClass("d-none"); }
    else { $(".box_info").removeClass("d-none"); }
}

$(() => { chkSize() })

$(window).on("resize", () => { chkSize() })