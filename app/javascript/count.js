function count () {
 let itemPrice = document.getElementById("item-price");
 itemPrice.addEventListener("keyup", () => {
  
   let item_price = document.getElementById("item-price").value;
  
   let addTaxPrice = document.getElementById("add-tax-price");
   addTaxPrice.innerHTML = Math.ceil(item_price * 0.1); 

   let profit = document.getElementById("profit");
   profit.innerHTML = Math.ceil(item_price * 0.9); 
  
});
}


window.addEventListener('load', count);