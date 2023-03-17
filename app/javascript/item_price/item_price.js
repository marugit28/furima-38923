window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  if (!priceInput){ return false;}
  priceInput.addEventListener("input", () => {
    const addTaxDom = document.getElementById("add-tax-price");
    const price = priceInput.value;
    const taxRate = 0.1;
    addTaxDom.innerHTML = Math.floor(price * taxRate);
    const ProfitDom = document.getElementById("profit");
    ProfitDom.innerHTML = Math.floor(price - Math.floor(price * taxRate));

})
  end
});