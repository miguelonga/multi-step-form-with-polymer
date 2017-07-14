Class('Register.Form', {

    Extends: Component,

    initialize: function() {
        Register.Form.Super.call(this, 'formulary')
        this.element.addEventListener('nextPage', this.nextPage.bind(this))
        this.element.addEventListener('collectData', this.collectData.bind(this))
        this.firstPage = document.getElementById('first-page')
        this.secondPage = document.getElementById('second-page')
        this.thirdPage = document.getElementById('third-page')
        this.fourthPage = document.getElementById('fourth-page')
        this.view = document.getElementById('view-page')
        this.registerData = {}
    },

    collectData: function() {
        Object.assign(
            this.registerData,
            {mail: this.firstPage.mail},
            {name: this.secondPage.name},
            {password: this.secondPage.password},
            {country: this.thirdPage.country},
            {zipcode: this.thirdPage.zipcode},
            {phone: this.thirdPage.phone},
            {age: this.thirdPage.age},
            {selectedTags: this.fourthPage.selectedTags},
        );
        Bus.publish('register', this.registerData)
    },

    showData: function(data) {
      this.view.data = data
    },

    nextPage: function(event) {
      var pageIndex = event.detail
      var nextPageIndex = pageIndex + 1
      var pages = [this.firstPage, this.secondPage, this.thirdPage, this.fourthPage, this.view]

      pages[pageIndex].show = false
      pages[nextPageIndex].show = true
    },

    subscribe: function() {
      Bus.subscribe('registered', this.showData.bind(this))
    }

});
