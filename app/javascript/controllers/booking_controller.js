import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["checkIn", "checkOut", "price", "pricePerDay", "btn"];

  connect() {
    console.log();
  }

  updateDates() {
    const checkInDate = this.checkInTarget.value;
    const checkOutDate = this.checkOutTarget.value;

    if (checkInDate && checkOutDate) {
      if (new Date(checkInDate) > new Date(checkOutDate)) {
        this.priceTarget.innerText = "The date is in the past";
        this.btnTarget.disabled = true;
        this.priceTarget.style.color = "red";
        return;
      }
      this.calculatePrice(checkInDate, checkOutDate);
    }
  }
  calculatePrice(checkIn, checkOut) {
    const price = this.calculatePlaceholderPrice(checkIn, checkOut);
    this.priceTarget.textContent = `Your price : $${price}`;
  }

  calculatePlaceholderPrice(checkIn, checkOut) {
    const start = new Date(checkIn);
    const end = new Date(checkOut);
    const days = Math.abs(end - start) / (1000 * 60 * 60 * 24);
    this.priceTarget.style.color = "green";
    this.btnTarget.disabled = false;
    return days * pricePerDay.innerText;
  }
}
