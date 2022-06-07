import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = [ 'photoPreview', 'photoFileField', 'defaultImage']

  changePhotoPreview(e) {
    const file = e.target.files[0]
    this.photoPreviewTarget.src = URL.createObjectURL(file)

    this.showPhotoPreview()
  }

  showPhotoPreview() {
    if (this.photoPreviewTarget.classList.contains('hidden')) {
      this.defaultImageTarget.classList.toggle('hidden')
      this.photoPreviewTarget.classList.toggle('hidden')
    }
  }

  selectNewPhoto() {
    this.photoFileFieldTarget.click()
  }
}
