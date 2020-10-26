import {Given, When, Then} from 'cypress-cucumber-preprocessor/steps';
import '@testing-library/cypress/add-commands';

//--------------------------------------------
//Scenario: All videos published in DLR by Kaltura-affiliated users should also be published in Kaltura
Given('A publisher who is affiliated with institutions who use Kaltura is logged in', () => {
    cy.login_kaltura_publisher();
});
Given('starts a registration', () => {
    cy.findByText(/ny registrering/i).click();
});
Given('registers a video', () => {
});

When('they perform the publication', () => {
});

Then('the video is published in DLR as a link to Kaltura', () => {
});

//--------------------------------------------
// Scenario: A user can view Kaltura videos who have been published from or imported in DLR
When('A user views a Kaltura video resource', () => {
    cy.visit('/resources/b711a13b-389c-41f2-93aa-a3dc160b15c0/content');
});

When('opens the resource content tab', () => {
    cy.findByText('Innhold').click();
});

Then('the Kaltura video has the correct embedding data', () => {
    cy.findByText('video-service/x-kaltura').should('exist');
});

//--------------------------------------------
// Scenario: A Publisher can publish a video in DLR from Kaltura link
Given('A publisher is logged in', () => {
});
Given('registers a link to Kaltura', () => {
});

When('opens the newly published resource', () => {
});

Then('a Kaltura URL is shown in the section for generated content', () => {
});
Then('has the correct embedding data', () => {
});

//--------------------------------------------
// Scenario: A Kaltura-affiliated publisher can view a list of their own Kaltura videos in DLR
When('they click on the tab named Kaltura', () => {
    cy.findByText(/Kaltura/i).click();
});

Then('they see a list of all the videos in Kaltura that they own', () => {
    cy.findByText(/ditt kaltura-innhold/i).should('exist');
    cy.findByText(/søker/i).should('not exist');
});
Then('each video that has not already been published in DLR has an import button next to it', () => {
});
Then('the videos that are already published in DLR are not importable', () => {
});

//--------------------------------------------
//Scenario: A Kaltura-affiliated publisher can publish a video from list of their own Kaltura videos in DLR
When('click the import button on a Kaltura video from the list', () => {
    cy.findByText(/importer/i).click();
});

Then('the video is published in DLR', () => {
});
Then('the video metadata is stored in DLR', () => {
});