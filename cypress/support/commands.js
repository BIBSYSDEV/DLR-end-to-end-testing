import "cypress-localstorage-commands";

Cypress.Commands.add('login_curator', () => {
    const link = `/loginRedirect?token=${Cypress.env('CYPRESS_CURATOR_TOKEN')}`
    cy.visit(link);
    throw new Error(link);
});