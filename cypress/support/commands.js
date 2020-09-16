import "cypress-localstorage-commands";

const waitForLogin = () => {
    cy.get('.glyphicon-user'); //pauses further execution until user is logged in
}

Cypress.Commands.add('login_curator', () => {
    cy.visit(`/loginRedirect?token=${Cypress.env('CURATOR_TOKEN')}`);
    waitForLogin();
});

Cypress.Commands.add('login_administrator', () => {
    cy.visit(`/loginRedirect?token=${Cypress.env('ADMINISTRATOR_TOKEN')}`);
    cy.get('.glyphicon-user'); //pauses further execution until user is logged in
});

Cypress.Commands.add('login_editor', () => {
    cy.visit(`/loginRedirect?token=${Cypress.env('EDITOR_TOKEN')}`);
    cy.get('.glyphicon-user'); //pauses further execution until user is logged in
});

Cypress.Commands.add('login_publisher', () => {
    cy.visit(`/loginRedirect?token=${Cypress.env('PUBLISHER_TOKEN')}`);
    cy.get('.glyphicon-user'); //pauses further execution until user is logged in
});
