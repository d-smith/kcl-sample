jar:
	./gradlew build


image: jar
	docker build -t kcl-sample .
