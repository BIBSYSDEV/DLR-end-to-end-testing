import {Given, When, Then} from 'cypress-cucumber-preprocessor/steps';

Given('a Curator is logged in', () => {
    cy.login_curator();
});

When('they click the menu', () => {
    cy.get(`[data-testid=menu_dropdown]`).click();
});

When('they click the "profile" menu item', () => {
    cy.get(`[data-testid=profile_page_link]`).click();
});

Then('they are routed to the "profile" page', () => {
    cy.url().should('include', '/user');
});

Then('the profile page contains a "roles" table with the text "Curator"', () => {
    cy.get('.roleHolder').contains( 'Kurator') //todo: language-independant
});

