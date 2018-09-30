const Listz = require("listz");
const assert = require("assert");
const fs = require("fs");

describe('Listz', function() {
  it("Should be a valid serialized Listz object.", function() {

    fs.readFileSync("./listz.json", "utf8", (error, result) => {

      if (error) { 
        assert.fail(error);
      }
      assert(Listz.isValid(result));

    });
  });
});