import "cypress-localstorage-commands";

Cypress.Commands.add('login_curator', () => {
    cy.visit("/");
    cy.get('.navbarlogo').click();
    cy.setLocalStorage("token", Cypress.env('CURATOR_TOKEN'));
    cy.setLocalStorage("anonymous", "false");
});