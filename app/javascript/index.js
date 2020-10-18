window.addEventListener("load", function() {
  let price = document.getElementById("item-price");
  price.addEventListener("input", function() {
    let item_price = parseInt(price.value);
    let tax1 = document.getElementById("add-tax-price");
    tax1.innerHTML = (item_price * 0.1);
    let sum1 = document.getElementById("profit");
    sum1.innerHTML = (item_price - (item_price * 0.1));
  });
});

// function item () {
//   let price = document.getElementById("item-price");
//   price.addEventListener("input", function() {
//     let item_price = parseInt(price.value);
//     let tax1 = document.getElementById("add-tax-price");
//     tax1.innerHTML = (item_price * 0.1);
//     let sum1 = document.getElementById("profit");
//     sum1.innerHTML = (item_price - (item_price * 0.1));
//   });
// };

// window.addEventListener('load',item);
