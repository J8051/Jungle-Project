describe('Jungle App', () => {
  
  it('can visit the homepage', () => {
    cy.visit("localhost:3000")
  })
  it("can navigate from the home page to the product detail page by clicking on a product.", () => {
    cy.get(".products article").should('have.length', 12).first().click() 
  });
  
})
