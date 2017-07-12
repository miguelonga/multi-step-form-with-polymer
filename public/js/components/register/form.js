Class('Register.Form', {

    Extends: Component,

    initialize: function() {
        Register.Form.Super.call(this, 'formulary');
        this.element.addEventListener('nextPage', this.navigate.bind(this))
    },

    navigate: function(pageIndex) {
      console.log(pageIndex.detail)
    }

});
