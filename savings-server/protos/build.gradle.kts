plugins {
    id("java")
    `java-library`
}

java {
    sourceSets.getByName("main").resources.srcDir("src/main/java")
}