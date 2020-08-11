const SEARCH_FIELD = '#searchform input[type=text]';
const SEARCH_FORM = '#searchform';

const DROPDOWN_MENU = '.dropdown-toggle .glyphicon-user'; //TODO: legg til data-cy="menu_dropdown" i html
const PROFILE_LINK = 'a[href="/user"]'; //TODO: data-cy="profile-link" i html

class DLRMainPage {

    static visit() {
        cy.visit('/');
    }

    static typeQuery(query) {
        cy.get(SEARCH_FIELD)
            .type(query);
    }

    static pressSearch() {
        cy.get(SEARCH_FORM).submit();
    }

    static pressMenu() {
        cy.get(DROPDOWN_MENU).click();
    }

    static pressProfileLink() {
        cy.get(PROFILE_LINK).click();
        //return new DLRMainPage();
    }

}

export default DLRMainPage;