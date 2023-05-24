describe('Jungle App', () => {
  it('can visit the homepage', () => {
    cy.visit("localhost:3000")
  })

  it("adds a product to the cart", () => {
    cy.get(".products article").find("button").contains("Add").click({force:true})
  });
  it("checks the cart has an item", () => {
    cy.get(".end-0").contains('My Cart (1)')
  });
})
