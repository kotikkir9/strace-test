import { readFile } from "fs";

readFile(
    "/mnt/c/Users/kiril/Desktop/strace/README.md",
    "utf8",
    (err, data) => {
        if (err) {
            console.error("Could not open file:", err);
            return;
        }
        console.log(data);
    }
);
