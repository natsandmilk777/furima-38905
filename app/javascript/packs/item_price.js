function tax() {
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener('input', () => { // イベントを'input'に変更
    const price = itemPrice.value;
    const addTaxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    const taxPrice = price * 0.1;
    const saleProfit = price - taxPrice;

    addTaxPrice.innerHTML = Math.floor(taxPrice);
    profit.innerHTML = Math.floor(saleProfit);
  });
}
window.addEventListener("load", tax);