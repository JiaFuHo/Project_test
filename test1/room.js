window.onload = (() => {
    // room
    let room_html = ``;
    let i;

    for (i = 1; i <= 10; i++) {
        if (i <= 3) {
            room_html += `
            <div class="row">
                <div class="col" id="img_box" data-bs-toggle="modal" data-bs-target="#img_modal">
                    <img src="./images/room_0${i * 3 - 2}.png" alt="" value="0${i * 3 - 2}">
                </div>
                <div class="col" id="img_box" data-bs-toggle="modal" data-bs-target="#img_modal">
                    <img src="./images/room_0${i * 3 - 1}.png" alt="" value="0${i * 3 - 1}">
                </div>
                <div class="col" id="img_box" data-bs-toggle="modal" data-bs-target="#img_modal">
                    <img src="./images/room_0${i * 3}.png" alt="" value="0${i * 3}">
                </div>
            </div>
            `;
        } else {
            room_html += `
            <div class="row">
                <div class="col" id="img_box" data-bs-toggle="modal" data-bs-target="#img_modal">
                    <img src="./images/room_${i * 3 - 2}.png" alt="" value="${i * 3 - 2}">
                </div>
                <div class="col" id="img_box" data-bs-toggle="modal" data-bs-target="#img_modal">
                    <img src="./images/room_${i * 3 - 1}.png" alt="" value="${i * 3 - 1}">
                </div>
                <div class="col" id="img_box" data-bs-toggle="modal" data-bs-target="#img_modal">
                    <img src="./images/room_${i * 3}.png" alt="" value="${i * 3}">
                </div>
            </div>
            `;
        }
        room_html += `
        <div class="modal fade" id="img_modal" tabindex="-1" aria-labelledby="img_modal_header" aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="img_modal_header"></h1>
                    </div>
                    <div class="modal-body row" id="img_modal_body">
                        <div class="col" id="img_modal_box">
                            <img src="" alt="">
                        </div>
                        <div class="col">
                            Lorem ipsum dolor sit amet consectetur adipisicing elit. 
                            Vel ipsa voluptatum maiores minus cumque voluptas porro quaerat dolorem impedit? 
                            Veritatis, laboriosam asperiores illo nobis consequatur est libero itaque molestias eligendi.
                            Autem vel deleniti error neque libero ducimus nulla cupiditate deserunt impedit saepe assumenda perferendis consectetur, 
                            ea temporibus nam laboriosam, possimus suscipit nihil molestias quo, beatae veniam animi fugiat. Dicta, sequi.
                            Eum iure odio optio asperiores, deserunt ipsam excepturi quos eveniet dolore harum molestiae quas nam doloribus quidem sed iste. 
                            Sunt numquam a et ducimus est placeat praesentium totam nam ipsam.
                            Excepturi voluptates doloribus eum nesciunt harum, repudiandae temporibus sit soluta, labore dolores, autem at impedit omnis. 
                            Quos velit ipsam, iste itaque fuga voluptas corrupti praesentium labore incidunt iure reprehenderit fugit.
                        </div>
                    </div>
                </div>
            </div>
        </div>`;

        $("#room_box").html(room_html);
    }

    $("#img_box img").on("click", (e) => {
        let room_index = $(e.target).attr("value");

        $(".modal-title").text("Room " + room_index);
        $("#img_modal_box img").attr("src", `./images/room_${room_index}.png`);
    });
})()