### Level 3 -> Level 4


**Goal**<br>
Connect to bandit3 and find out the password stored in a hidden file

**Learnings**<br>
- check file name by `ls -al`
- same as before _cat_ & press _tab_
- **_markdown_**
    - updated markdown.json file to generate automatic notes.md snippet
    - Files > Preferences > configure snippets > markdown.json
    ```json
    "Notes Boilerplate": {
		"prefix": "notes-md", //trigger key
		"body": [
			"### Level # -> Level #",
			"",
			"",
			"**Goal**<br>",
			"",
			"**Learnings**<br>",
			"",
			"**Outcome**<br>",
			"",
			"Password to next level:: ``"
		],
		"description": "Template for notes.md"
	}
    ```

**Outcome**<br>
Goal Reached! <!-- Password to next level:: `2WmrDFRmJIq3IPxneAaMGhap0pFhF3NJ` -->

