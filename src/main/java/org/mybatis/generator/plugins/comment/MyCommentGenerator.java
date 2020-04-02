package org.mybatis.generator.plugins.comment;

import org.mybatis.generator.api.CommentGenerator;
import org.mybatis.generator.api.IntrospectedColumn;
import org.mybatis.generator.api.IntrospectedTable;
import org.mybatis.generator.api.dom.java.*;
import org.mybatis.generator.api.dom.xml.XmlElement;

import java.util.Properties;
import java.util.Set;

public class MyCommentGenerator implements CommentGenerator {

	public void addConfigurationProperties(Properties properties) {

	}

	public void addFieldComment(Field field, IntrospectedTable introspectedTable, IntrospectedColumn introspectedColumn) {
		if (introspectedColumn.getRemarks() != null && !introspectedColumn.getRemarks().equals("")) {
			field.addJavaDocLine("/**");
			field.addJavaDocLine(" * " + introspectedColumn.getRemarks());
			// addJavadocTag(field, false);
			field.addJavaDocLine(" */");
		}
	}

	public void addFieldComment(Field field, IntrospectedTable introspectedTable) {

	}

	public void addModelClassComment(TopLevelClass topLevelClass, IntrospectedTable introspectedTable) {

	}

	public void addClassComment(InnerClass innerClass, IntrospectedTable introspectedTable) {

	}

	public void addClassComment(InnerClass innerClass, IntrospectedTable introspectedTable, boolean b) {

	}

	public void addEnumComment(InnerEnum innerEnum, IntrospectedTable introspectedTable) {

	}

	public void addGetterComment(Method method, IntrospectedTable introspectedTable, IntrospectedColumn introspectedColumn) {

	}

	public void addSetterComment(Method method, IntrospectedTable introspectedTable, IntrospectedColumn introspectedColumn) {

	}

	public void addGeneralMethodComment(Method method, IntrospectedTable introspectedTable) {

	}

	public void addJavaFileComment(CompilationUnit compilationUnit) {

	}

	public void addComment(XmlElement xmlElement) {

	}

	public void addRootComment(XmlElement xmlElement) {

	}

	@Override
	public void addGeneralMethodAnnotation(Method method, IntrospectedTable introspectedTable, Set<FullyQualifiedJavaType> imports) {

	}

	@Override
	public void addGeneralMethodAnnotation(Method method, IntrospectedTable introspectedTable, IntrospectedColumn introspectedColumn, Set<FullyQualifiedJavaType> imports) {

	}

	@Override
	public void addFieldAnnotation(Field field, IntrospectedTable introspectedTable, Set<FullyQualifiedJavaType> imports) {

	}

	@Override
	public void addFieldAnnotation(Field field, IntrospectedTable introspectedTable, IntrospectedColumn introspectedColumn, Set<FullyQualifiedJavaType> imports) {

	}

	@Override
	public void addClassAnnotation(InnerClass innerClass, IntrospectedTable introspectedTable, Set<FullyQualifiedJavaType> imports) {

	}
}
