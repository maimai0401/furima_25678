if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  window.addEventListener("load", function(){ //JSを読み込ませる

    const price_field = document.getElementById("item-price") //価格を入力する部分を取得し変数に
    price_field.addEventListener("input", function(){ //キーが離されたときに発生 "keyup"でもok
      const fee_field = document.getElementById("add-tax-price") //販売手数料が表示される部分
      const profit_field = document.getElementById("profit") //売買利益が表示される部分
      let price = this.value; //.valueで入力した金額の値を取得
      let fee = price / 10; //販売手数料
      let profit = price - fee; //売買利益
  
      fee_field.textContent = fee; //代入されたものを=feeで表示
      profit_field.textContent = profit;
      //".textContent"はHTMLを解釈せずにそのまま文字として出力する
    })
  })
}  



  //   function fee (){
//     const price_field = document.getElementById("item-price");
//     price_field.addEventListener("keyup", function() {
//       let price = this.value;
//       let fee = (price / 10); //販売手数料
//       let profit = (price - fee); //売買利益

//       const fee_field = document.getElementById("add-tax-price") //販売手数料が表示される部分
//       const profit_field = document.getElementById("profit") //売買利益が表示される部分
//       fee_field.textContent = fee; 
//       profit_field.textContent = profit; 
//     });
//   }
// window.addEventListener('load', fee);
// }