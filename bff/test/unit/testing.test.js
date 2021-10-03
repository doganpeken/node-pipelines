"use strict";

const axios = require("axios");

describe("", () => {
  beforeEach(() => {});

  it("can get all entries", async () => {
    const response = await axios.get("http://20.93.189.154/guestbook/entries");
    expect(response.status).toEqual(200);
  });

  afterAll((done) => {
    done();
  });
});
