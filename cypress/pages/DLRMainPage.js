const SEARCH_FIELD = '#searchform input[type=text]';
const SEARCH_FORM = '#searchform';
class DLRMainPage {

    static visit() {
        cy.visit('/');
    }

    static type(query) {
        cy.get(SEARCH_FIELD)
            .type(query);
    }

    static pressSearch() {
        cy.get(SEARCH_FORM).submit();
        //return new DLRMainPage();
    }

}

export default DLRMainPage;