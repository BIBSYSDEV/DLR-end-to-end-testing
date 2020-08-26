import {Given, When, Then} from 'cypress-cucumber-preprocessor/steps';
import DLRMainPage from '../../pages/DLRMainPage'

Given('a Curator is logged in', () => {
    cy.login_curator();
});

When('they click the menu', () => {
    DLRMainPage.pressMenu();
});

When('they click the "profile" menu item', () => {
    DLRMainPage.pressProfileLink();
});

Then('they are routed to the "profile" page', () => {
    cy.url().should('include', '/user');
});

Then('the profile page contains a "roles" table with the text "Curator"', () => {
    cy.get('.roleHolder').contains( 'Kurator') //todo: language-independant
});

