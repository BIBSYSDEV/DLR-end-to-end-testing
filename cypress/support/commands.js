import "cypress-localstorage-commands";

Cypress.Commands.add('login_curator', () => {

    throw new Error('TOKEN! ' + Cypress.env('CURATOR_TOKEN'));

    cy.visit(`/loginRedirect?token=${Cypress.env('CURATOR_TOKEN')}`);
});