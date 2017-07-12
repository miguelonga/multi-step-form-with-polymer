Class('Register.Form', {

    Extends: Component,

    initialize: function() {
        Register.Form.Super.call(this, 'formulary')
        this.element.addEventListener('nextPage', this.nextPage.bind(this))
        this.firstPage = document.getElementById('first-page')
        this.secondPage = document.getElementById('second-page')
    },

    nextPage: function(event) {
      var pageIndex = event.detail
      var nextPageIndex = pageIndex + 1
      var pages = [this.firstPage, this.secondPage]

      pages[pageIndex].show = false
      pages[nextPageIndex].show = true
    }

});
