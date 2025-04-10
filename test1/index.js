window.onload = (() => {
    // section
    let carousel_html = ``;
    let select_html = ``;
    let rooms = 30;
    let i;

    for (i = 1; i <= rooms; i++) {
        if (i === 1) {
            carousel_html += `
            <div class="carousel-item active" data-bs-interval="2500">
                <img src="./images/room_0${i}.png" class="d-block w-100" id="carousel-img" alt="">
            </div>`;
            select_html += `<option value="Room 0${i}">Room 0${i}</option>`;
        } else if (i < 10) {
            carousel_html += `
            <div class="carousel-item" data-bs-interval="2500">
                <img src="./images/room_0${i}.png" class="d-block w-100" id="carousel-img" alt="">
            </div>`;
            select_html += `<option value="Room 0${i}">Room 0${i}</option>`;
        } else {
            carousel_html += `
            <div class="carousel-item" data-bs-interval="2500">
                <img src="./images/room_${i}.png" class="d-block w-100" id="carousel-img" alt="">
            </div>`;
            select_html += `<option value="Room ${i}">Room ${i}</option>`;
        }

        $(".carousel-inner").html(carousel_html);
    }

    user_room.innerHTML += select_html;

    submit_btn.onclick = () => {
        setTimeout(() => contact_form.reset(), 1000)
    };

    $.ajax({
        url: "./FAQ.json",
        dataType: "json",

        success: (data) => {
            let flush_html = ``;

            data.forEach((value) => {
                flush_html += `
                <div class="accordion-item">
                    <h2 class="accordion-header">
                        <button id="accordion_btn_${value.I}" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#accordion_flush_${value.I}" aria-expanded="false" aria-controls="accordion_flush_${value.I}">
                        ${value.Q}
                        </button>
                    </h2>
                    <div id="accordion_flush_${value.I}" class="accordion-collapse collapse" data-bs-parent="#accordion_flush">
                        ${value.A}
                    </div>
                </div>`;

                $("#accordion_flush").html(flush_html);
            });
        }
    })
})()