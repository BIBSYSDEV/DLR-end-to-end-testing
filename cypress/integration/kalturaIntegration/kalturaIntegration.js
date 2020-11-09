import {Given, When, Then} from 'cypress-cucumber-preprocessor/steps';
import '@testing-library/cypress/add-commands';
import 'cypress-file-upload';

Cypress.on('uncaught:exception', () => {
    return false;
});

//--------------------------------------------
//Scenario: All videos published in DLR by Kaltura-affiliated users should also be published in Kaltura
Given('A publisher who is affiliated with institutions who use Kaltura is logged in', () => {
    cy.login_kaltura_publisher();
});
Given('starts a registration', () => {
    cy.get('[data-testid=add-resource-button]').click();
});
Given('registers a video', () => {
    cy.get('input[type="file"]').attachFile('testvideo.mov');
    cy.wait(2000);
    cy.get('[data-testid=create-file-resource-button]').click();
    cy.wait(10000);
    cy.findByText('Lagring fullført').should('exist');
    cy.get('[data-testid=edit-or-publish-page]').should('exist');
});

When('they perform the publication', () => {
    cy.get('[data-testid=title-input]').type('Bildetittel');
    cy.get('[data-testid=group-license-question-1-input]').eq(1).check();
    cy.get('[data-testid=choose-license-input]').eq(0).check();
    cy.get('[data-testid=publish-button]').click();
});

Then('the video is published in DLR', () => {
    cy.get('[data-testid=published-with-license-information]').should('exist');
});

When('they open the resource content tab', () => {
    cy.get('[data-testid=content-tab]').click();
});

Then('the Kaltura video has the correct embedding data', () => {
    cy.get('[data-testid=resource-content-mime-type]').should('contain.text', 'video-service/x-kaltura');
});

//--------------------------------------------
// Scenario: A user can view Kaltura videos who have been published from or imported in DLR
When('A user views a Kaltura video resource', () => {
    cy.visit('/resources/b711a13b-389c-41f2-93aa-a3dc160b15c0/content');
});

//--------------------------------------------
// Scenario: A Kaltura-affiliated publisher can view a list of their own Kaltura videos in DLR
When('they click on the tab named Kaltura', () => {
    cy.get('[data-testid=nav-tab-kaltura]').click();
});

Then('they see a list of all the videos in Kaltura that they own', () => {
    cy.get('[data-testid=kaltura-entries-row]').should('exist');
});
Then('each video that has not already been published in DLR has an import button next to it', () => {
    cy.get('[data-testid=import-kaltura-video-button]').should('exist');
});
Then('the videos that are already published in DLR are not importable', () => {
    cy.get('[data-testid=kaltura-video-already-imported]')
        .each(($el) => {
            cy.wrap($el)
                .parents('[data-testid=kaltura-entries-row]')
                .get('[data-testid=import-kaltura-video-button]').should('not.exist');
        })
});

//--------------------------------------------
//Scenario: A Kaltura-affiliated publisher can publish a video from list of their own Kaltura videos in DLR
When('click the import button on a Kaltura video from the list', () => {
    cy.get('[data-testid=import-kaltura-video-button]').first().click();
});