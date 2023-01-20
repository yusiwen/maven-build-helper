# Maven build helper

[![License](https://img.shields.io/badge/license-Apache%202-4EB1BA.svg)](https://www.apache.org/licenses/LICENSE-2.0.html)
[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://GitHub.com/yusiwen/maven-build-helper/graphs/commit-activity)
[![GitHub tag](https://img.shields.io/github/tag/yusiwen/maven-build-helper.svg)](https://GitHub.com/yusiwen/maven-build-helper/tags/)
[![Maven Central](https://maven-badges.herokuapp.com/maven-central/cn.yusiwen/maven-build-helper/badge.svg)](https://maven-badges.herokuapp.com/maven-central/cn.yusiwen/maven-build-helper)

My helper package of maven building procedures.

Including:

- [checkstyle.xml](https://github.com/yusiwen/maven-build-helper/blob/master/src/main/resources/checkstyle.xml): Configuration file for [CheckStyle](https://checkstyle.sourceforge.io/)
- [findbugs-exclude-filter.xml](https://github.com/yusiwen/maven-build-helper/blob/master/src/main/resources/findbugs-exclude-filter.xml): Configuration file for Findbugs/Spotbugs
- [formatter-2spaces.xml](https://github.com/yusiwen/maven-build-helper/blob/master/src/main/resources/formatter-2spaces.xml): Formatter profile, with 2 spaces as indentation, for [formatter-maven-plugin](https://code.revelc.net/formatter-maven-plugin/)
- [formatter-4spaces.xml](https://github.com/yusiwen/maven-build-helper/blob/master/src/main/resources/formatter-4spaces.xml): Formatter profile, with 4 spaces as indentation, for [formatter-maven-plugin](https://code.revelc.net/formatter-maven-plugin/)
- [p3c-formatter-2spaces.xml](https://github.com/yusiwen/maven-build-helper/blob/master/src/main/resources/p3c-formatter-2spaces.xml): Formatter profile, with 2 spaces as indentation and complies with [alibaba/p3c](https://github.com/alibaba/p3c), for [formatter-maven-plugin](https://code.revelc.net/formatter-maven-plugin/)
- [p3c-formatter-4spaces.xml](https://github.com/yusiwen/maven-build-helper/blob/master/src/main/resources/p3c-formatter-4spaces.xml): Formatter profile, with 4 spaces as indentation and complies with [alibaba/p3c](https://github.com/alibaba/p3c), for [formatter-maven-plugin](https://code.revelc.net/formatter-maven-plugin/)
- [hooks/commit-msg](https://github.com/yusiwen/maven-build-helper/blob/master/src/main/resources/hooks/commit-msg): git commit-msg hook for conventional commit specification checking before committing
- [hooks/pre-commit](https://github.com/yusiwen/maven-build-helper/blob/master/src/main/resources/hooks/pre-commit): git pre-commit hook for formatting files before committing

## Usage

```xml
<plugin>
    <groupId>net.revelc.code.formatter</groupId>
    <artifactId>formatter-maven-plugin</artifactId>
    <version>${formatter.plugin}</version>
    <dependencies>
        <dependency>
            <groupId>cn.yusiwen</groupId>
            <artifactId>maven-build-helper</artifactId>
            <version>${maven-build-helper.version}</version>
        </dependency>
    </dependencies>
    <configuration>
        <!--suppress UnresolvedMavenProperty -->
        <configFile>p3c-formatter-${indent.size}spaces.xml</configFile>
    </configuration>
</plugin>
```

For more details, see my [Parent Pom Project](https://github.com/yusiwen/java-base-parent)
