"use strict";

const express = require("express");
const router = express.Router();
const axios = require("axios");

router.get("/", async (req, res) => {
  const response = await axios.get("http://20.93.189.154/guestbook/entries");
  res.send(response.data);
});

router.post("/", async (req, res) => {
  const entrie = req.body;
  if (entrie === undefined) {
    res.send("Bad request.").status(400);
    return;
  }
  let now = new Date();
  entrie.created = now.toISOString();
  const response = await axios.post(
    "http://20.93.189.154/guestbook/entries",
    entrie
  );
  res.status(response.status).send({ message: "OK" });
});

module.exports = router;
