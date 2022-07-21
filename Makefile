.PHONY: new-post

CURR_DATE = $$(date "+%Y-%m-%d")
new-post:
	hugo new posts/$(CURR_DATE)-$(title).md
