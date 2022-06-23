IMG = clojure:openjdk-8-lein-2.9.8
LeinProfilesPath = $(PWD)/config/lein-profiles.clj
M2Path = $(PWD)/.m2

.PHONY: repl
repl:
	sudo docker run -ti -m=4g \
		-v $(LeinProfilesPath):/root/.lein/profiles.clj \
		-v $(M2Path):/root/.m2 \
		--name=clj-repl \
		$(IMG) lein repl

.PHONY: clean
clean:
	sudo docker rm -f clj-repl
