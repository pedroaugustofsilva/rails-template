import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['content'];

  toggle() {
    this.contentTargets.forEach((t) => t.classList.toggle(this.data.get('class')));
  }

  toggleMobileMenu() {
    document.getElementById('mobile-menu').classList.toggle(this.data.get('class'))
  }
}
