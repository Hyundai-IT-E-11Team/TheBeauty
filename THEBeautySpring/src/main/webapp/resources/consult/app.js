var OV;
var session;

function joinSession(currUserRole, mySessionId) {
  OV = new OpenVidu();
  session = OV.initSession();

  session.on("streamCreated", function (event) {
    session.subscribe(event.stream, "subscriber");
  });

  session.on("signal", function (event) {
    let item = JSON.parse(event.data);
    let card = `
		    <div id="${item.productSeq}" class="card" >
		        <img src="${item.productImgurl}" alt="Product 1">
		        <a href="/theBeauty/product/detailPage/${item.productSeq}"
		        onclick="window.open(this.href, '_blank', 'width=800, height=600'); return false;"
		        style="text-decoration: none; color: black;"
		        >
		        <h3>${item.productName}</h3>
				</a>
		        <p class="price">${item.productPrice}</p>
		        <button onclick="deleteCard('${item.productSeq}')">삭제</button>
		    </div>
		`;
    $("#u-items").append(card);
  });

  getToken(mySessionId, currUserRole).then((token) => {
    session
      .connect(token)
      .then(() => {
        $("#after-join").css("display", "block");
        $("#join").css("display", "none");
        var publisher = OV.initPublisher("publisher");
        session.publish(publisher);
      })
      .catch((error) => {
        console.log(
          "There was an error connecting to the session:",
          error.code,
          error.message
        );
      });
  });
}

function deleteCard(cardId) {
  $("#" + cardId).remove();
}

function leaveSession(reservationSeq) {
  if (confirm("상담을 종료하시겠습니까? 다시 입장할 수 없습니다.")) {
    session.disconnect();
    window.location.replace("/theBeauty/consult/end/" + reservationSeq);
  }
}

window.onbeforeunload = function () {
  if (session) session.disconnect();
};

function sendMessage(product) {
  session
    .signal({
      data: JSON.stringify(product),
      to: [],
      type: "my-chat",
    })
    .then(() => {
      console.log("전송성공");
    })
    .catch((error) => {
      console.error(error);
    });
}

var APPLICATION_SERVER_URL = "https://192.168.0.89/theBeauty/";

function search(roleNum) {
  $("#c-items").html("");
  // AJAX GET 요청
  $.ajax({
    url:
      APPLICATION_SERVER_URL +
      "product/list/" +
      roleNum +
      "/" +
      $(".search-input").val(),
    type: "GET",
    success: function (data) {
      console.log(data);
      for (let i = 0; i < data.length; i++) {
        let card = `
      		    <div class="card">
      		        <img src="${data[i].productImgurl}" alt="Product 1">
      		        <h3>${data[i].productName}</h3>
      		        <p class="price">${data[i].productPrice}</p>
      		        <button onclick="sendMessage(${JSON.stringify(data[i]).replace(
                    /"/g,
                    "&quot;"
                  )})">전송</button>
      		    </div>
      		`;
        $("#c-items").append(card);
      }
    },
    error: function () {
      // 요청이 실패했을 때 실행되는 콜백 함수
      console.log("데이터를 불러오는데 실패했습니다.");
    },
  });
}

function getProducts(roleNum) {
  $("#c-items").html("");
  // AJAX GET 요청
  $.ajax({
    url: APPLICATION_SERVER_URL + "product/list/" + roleNum,
    type: "GET",
    success: function (data) {
      for (let i = 0; i < data.length; i++) {
        let card = `
        		    <div class="card">
        		        <img src="${data[i].productVO.productImgurl}" alt="Product 1">
        		        <h3>${data[i].productVO.productName}</h3>
        		        <p class="price">${data[i].productVO.productPrice}</p>
        		        <button onclick="sendMessage(${JSON.stringify(
                      data[i].productVO
                    ).replace(/"/g, "&quot;")})">전송</button>
        		    </div>
        		`;
        $("#c-items").append(card);
      }
    },
    error: function () {
      // 요청이 실패했을 때 실행되는 콜백 함수
      console.log("데이터를 불러오는데 실패했습니다.");
    },
  });
}

/**
 * -------------------------------------------- GETTING A TOKEN FROM YOUR
 * APPLICATION SERVER -------------------------------------------- The methods
 * below request the creation of a Session and a Token to your application
 * server. This keeps your OpenVidu deployment secure.
 *
 * In this sample code, there is no user control at all. Anybody could access
 * your application server endpoints! In a real production environment, your
 * application server must identify the user to allow access to the endpoints.
 *
 * Visit https://docs.openvidu.io/en/stable/application-server to learn more
 * about the integration of OpenVidu in your application server.
 */

function getToken(mySessionId, currUserRole) {
  if (currUserRole == 0) {
    return createToken(mySessionId);
  } else
    return createSession(mySessionId).then((sessionId) =>
      createToken(sessionId)
    );
}

function createSession(sessionId) {
  return new Promise((resolve, reject) => {
    $.ajax({
      type: "POST",
      url: APPLICATION_SERVER_URL + "api/sessions",
      data: JSON.stringify({ customSessionId: sessionId }),
      headers: { "Content-Type": "application/json" },
      success: (response) => resolve(response), // The sessionId
      error: (error) => reject(error),
    });
  });
}

function createToken(sessionId) {
  return new Promise((resolve, reject) => {
    $.ajax({
      type: "POST",
      url:
        APPLICATION_SERVER_URL + "api/sessions/" + sessionId + "/connections",
      data: JSON.stringify({}),
      headers: { "Content-Type": "application/json" },
      success: (response) => resolve(response), // The token
      error: (error) => {
        alert("아직 상담사가 상담을 시작하지 않았습니다.");
        reject(error);
      },
    });
  });
}
