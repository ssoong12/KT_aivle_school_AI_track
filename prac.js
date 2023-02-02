// -,+ 버튼 클릭 시 수량 증가 및 총액 합산

// 변경된 값을 저장
var sell_price; // 단가 * 수량
var amount; // 수량

// init 초기값을 지정할 수 있다.
function init() {
  sell_price = document.form.sell_price.value;
  amount = document.form.amount.value;
  document.form.sum.value = sell_price;
  change();
}

// add
// howmany 값을 1 증가시키고, 합계를 계산
function add() {
  hm = document.form.amount;
  sum = document.form.sum;
  hm.value++;

  sum.value = parseInt(hm.value) * sell_price;
}

// del
// howmany 값을 1 감소시키고 합계를 계산
function del() {
  hm = document.form.amount;
  sum = document.form.sum;

  // 에러 처리 : 음수 값
  if (hm.value > 1) {
    hm.value--;
    sum.value = parseInt(hm.value) * sell_price;
  }
}

function change() {
  hm = document.form.amount;
  sum = document.form.sum;

  if (hm.value < 0) {
    hm.value = 0;
  }
  sum.value = parseInt(hm.value) * sell_price;
}

// 메뉴 클릭 시 메뉴 항목 전환
// 클릭한 메뉴의 테이블만 보이기
$("#menu tr .title:eq(0)").on("click", function () {
  $(".sub:eq(0)").removeClass("hidden");
});
$("#menu tr .title:eq(1)").on("click", function () {
  $(".sub:eq(0)").addClass("hidden");
  $(".sub:eq(1)").removeClass("hidden");
});
$("#menu tr .title:eq(2)").on("click", function () {
  $(".sub:eq(0), .sub:eq(1)").addClass("hidden");
  $(".sub:eq(2)").removeClass("hidden");
});
$("#menu tr .title:eq(3)").on("click", function () {
  $(".sub:eq(0), .sub:eq(1), .sub:eq(2)").addClass("hidden");
  $(".sub:eq(3)").removeClass("hidden");
});
$("#menu tr .title:eq(4)").on("click", function () {
  $(".sub:eq(0), .sub:eq(1), .sub:eq(2), .sub:eq(3)").addClass("hidden");
  $(".sub:eq(4)").removeClass("hidden");
});
$("#menu tr .title:eq(5)").on("click", function () {
  $(".sub:eq(0), .sub:eq(1), .sub:eq(2), .sub:eq(3), .sub:eq(4)").addClass(
    "hidden"
  );
  $(".sub:eq(5)").removeClass("hidden");
});
$("#menu tr .title:eq(6)").on("click", function () {
  $(".sub:not(:eq(6))").addClass("hidden");
  $(".sub:eq(6)").removeClass("hidden");
});

// 온라인 시계
function clock() {
  const heading = document.querySelector("p");
  let today = new Date();
  let hour = today.getHours();
  let minute = today.getMinutes();
  let second = today.getSeconds();
  heading.innerHTML = hour + " : " + minute + " : " + second;
}
clock();
setInterval(function () {
  clock();
}, 1000);
