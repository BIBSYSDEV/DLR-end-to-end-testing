import "cypress-localstorage-commands";

Cypress.Commands.add('login_curator', () => {
    cy.visit("/loginRedirect?token=" + Cypress.env('CURATOR_TOKEN'));
});