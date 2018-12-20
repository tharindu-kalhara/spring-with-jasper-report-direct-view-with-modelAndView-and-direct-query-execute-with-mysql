# spring-with-jasper-report-direct-view-with-modelAndView-and-direct-query-execute-with-mysql

## dependencies        
        <dependency>
            <groupId>net.sf.jasperreports</groupId>
            <artifactId>jasperreports</artifactId>
            <version>6.6.0</version>
        </dependency>
        <dependency>
            <groupId>xml-apis</groupId>
            <artifactId>xml-apis</artifactId>
            <version>1.4.01</version>
        </dependency>
## controller class
```
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.jasperreports.JasperReportsPdfView;

import javax.sql.DataSource;

@Controller
@RequestMapping(value = "/jasper")
public class JasperController {

    @Autowired
    private ApplicationContext appContext;
    @Autowired
    private DataSource dataSource;

    @RequestMapping(value = "/pdf", method = RequestMethod.GET)
    public ModelAndView report() {

        JasperReportsPdfView view = new JasperReportsPdfView();
        view.setJdbcDataSource(dataSource);
        view.setUrl("classpath:Cherry.jrxml");
        view.setApplicationContext(appContext);
        return new ModelAndView(view);
    }
}
```

## sample jrxml(jasper report template file) file.
```
<?xml version="1.0" encoding="UTF-8"?>
<!-- Created with Jaspersoft Studio version 6.6.0.final using JasperReports Library version 6.6.0  -->
<jasperReport xmlns="http://jasperreports.sourceforge.net/jasperreports" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://jasperreports.sourceforge.net/jasperreports http://jasperreports.sourceforge.net/xsd/jasperreport.xsd" name="Cherry" pageWidth="595" pageHeight="842" columnWidth="535" leftMargin="20" rightMargin="20" topMargin="20" bottomMargin="20" uuid="13acf49e-4913-4d1b-bccc-113817ad15d1">
	<property name="com.jaspersoft.studio.data.sql.tables">
		<![CDATA[Y2FycyAsMTUsMTUsNWU2MDQ5NzgtNDFjNC00NGRjLTlhMWYtNzhmMDM2YzZhNTY3Ow==
]]>
	</property>
	<property name="com.jaspersoft.studio.data.defaultdataadapter" value="payboot-mysql.xml"/>
	<style name="Title" forecolor="#FFFFFF" fontName="Times New Roman" fontSize="50" isBold="false"/>
	<style name="SubTitle" forecolor="#CCCCCC" fontName="Times New Roman" fontSize="18" isBold="false"/>
	<style name="Column header" forecolor="#666666" fontName="Times New Roman" fontSize="14" isBold="true"/>
	<style name="Detail" mode="Transparent" fontName="Times New Roman"/>
	<style name="Row" mode="Transparent" fontName="Times New Roman" pdfFontName="Times-Roman">
		<conditionalStyle>
			<conditionExpression><![CDATA[$V{REPORT_COUNT}%2 == 0]]></conditionExpression>
			<style mode="Opaque" backcolor="#F0EFEF"/>
		</conditionalStyle>
	</style>
	<queryString language="SQL">
		<!--<![CDATA[SELECT * FROM CARS]]>-->
		<![CDATA[SELECT * FROM CARS]]>
	</queryString>
	<field name="ID" class="java.lang.Integer">
		<property name="com.jaspersoft.studio.field.label" value="ID"/>
		<property name="com.jaspersoft.studio.field.tree.path" value="CARS"/>
	</field>
	<field name="NAME" class="java.lang.String">
		<property name="com.jaspersoft.studio.field.label" value="NAME"/>
		<property name="com.jaspersoft.studio.field.tree.path" value="CARS"/>
	</field>
	<field name="PRICE" class="java.lang.Integer">
		<property name="com.jaspersoft.studio.field.label" value="PRICE"/>
		<property name="com.jaspersoft.studio.field.tree.path" value="CARS"/>
	</field>
	<group name="Group1">
		<groupExpression><![CDATA[$F{ID}]]></groupExpression>
		<groupHeader>
			<band height="37">
				<frame>
					<reportElement mode="Opaque" x="0" y="7" width="555" height="24" forecolor="#B89F7D" backcolor="#000000" uuid="0a5fc4ac-2e39-4b7a-8f96-59f8eb2df66d"/>
					<textField isStretchWithOverflow="true">
						<reportElement style="SubTitle" isPrintRepeatedValues="false" x="2" y="0" width="479" height="24" forecolor="#FFFFFF" uuid="4fbebfd3-a184-45af-b7d9-5c3faaf087b5"/>
						<textElement>
							<font isBold="false"/>
						</textElement>
						<textFieldExpression><![CDATA[$F{ID}]]></textFieldExpression>
					</textField>
				</frame>
			</band>
		</groupHeader>
		<groupFooter>
			<band height="6"/>
		</groupFooter>
	</group>
	<group name="Group2">
		<groupExpression><![CDATA[$F{NAME}]]></groupExpression>
		<groupHeader>
			<band height="30">
				<textField>
					<reportElement positionType="Float" x="0" y="4" width="555" height="26" forecolor="#000000" uuid="539b4cf8-ac6d-4bf8-ae91-63f3d4149f2d"/>
					<textElement>
						<font fontName="Times New Roman" size="16" isBold="false"/>
					</textElement>
					<textFieldExpression><![CDATA[$F{NAME}]]></textFieldExpression>
				</textField>
			</band>
		</groupHeader>
	</group>
	<group name="PRICE">
		<groupExpression><![CDATA[$F{PRICE}]]></groupExpression>
	</group>
	<background>
		<band splitType="Stretch"/>
	</background>
	<title>
		<band height="132" splitType="Stretch">
			<image>
				<reportElement x="456" y="0" width="99" height="132" uuid="97705585-a0b5-4ec7-86f3-ae10c220e6af"/>
				<imageExpression><![CDATA["logo.png"]]></imageExpression>
			</image>
			<frame>
				<reportElement mode="Opaque" x="0" y="0" width="451" height="95" backcolor="#000000" uuid="6c6ca4e1-17cd-4913-93d6-5e670ea9ae8a"/>
				<staticText>
					<reportElement style="Title" x="0" y="0" width="370" height="66" uuid="a2a2cac8-5a7d-4487-8c54-dab235ce4e21"/>
					<textElement>
						<font isBold="false"/>
					</textElement>
					<text><![CDATA[Test report]]></text>
				</staticText>
				<staticText>
					<reportElement style="SubTitle" x="157" y="66" width="249" height="29" uuid="8978eac3-c578-41c9-837e-48d2b0184642"/>
					<textElement>
						<font size="22" isBold="false"/>
					</textElement>
					<text><![CDATA[Cherry SubTitle]]></text>
				</staticText>
			</frame>
			<frame>
				<reportElement mode="Opaque" x="0" y="100" width="451" height="32" forecolor="#000000" backcolor="#CC0000" uuid="e3c14156-5b51-4201-918b-97fdc012e5d4"/>
				<textField pattern="EEEEE dd MMMMM yyyy">
					<reportElement x="307" y="12" width="144" height="20" forecolor="#FFFFFF" uuid="5c3301e7-a737-4c59-8a2f-a6c79fd1adb8"/>
					<textElement textAlignment="Right">
						<font size="12"/>
					</textElement>
					<textFieldExpression><![CDATA[new java.util.Date()]]></textFieldExpression>
				</textField>
			</frame>
		</band>
	</title>
	<pageHeader>
		<band splitType="Stretch"/>
	</pageHeader>
	<columnHeader>
		<band height="26" splitType="Stretch"/>
	</columnHeader>
	<detail>
		<band height="18" splitType="Stretch">
			<frame>
				<reportElement style="Row" mode="Opaque" x="0" y="0" width="555" height="18" uuid="b50221b5-8254-440b-8c6f-1f0b138c9259"/>
			</frame>
		</band>
	</detail>
	<columnFooter>
		<band height="7" splitType="Stretch">
			<line>
				<reportElement positionType="FixRelativeToBottom" x="0" y="3" width="555" height="1" uuid="1133a906-5b71-476e-9f3e-bc97c97058c1"/>
				<graphicElement>
					<pen lineWidth="0.5" lineColor="#999999"/>
				</graphicElement>
			</line>
		</band>
	</columnFooter>
	<pageFooter>
		<band height="25" splitType="Stretch">
			<frame>
				<reportElement mode="Opaque" x="0" y="1" width="555" height="24" forecolor="#D0B48E" backcolor="#000000" uuid="729c3539-f946-4d0e-a0a7-bda2815ea1b0"/>
				<textField evaluationTime="Report">
					<reportElement style="Column header" x="513" y="0" width="40" height="20" forecolor="#FFFFFF" uuid="4834e99c-7f6c-485a-b098-50e5187f2ab4"/>
					<textElement verticalAlignment="Middle">
						<font size="10" isBold="false"/>
					</textElement>
					<textFieldExpression><![CDATA[" " + $V{PAGE_NUMBER}]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement style="Column header" x="433" y="0" width="80" height="20" forecolor="#FFFFFF" uuid="9825b46e-76f1-469a-abb8-a1cc27aad685"/>
					<textElement textAlignment="Right" verticalAlignment="Middle">
						<font size="10" isBold="false"/>
					</textElement>
					<textFieldExpression><![CDATA["Page "+$V{PAGE_NUMBER}+" of"]]></textFieldExpression>
				</textField>
				<textField pattern="EEEEE dd MMMMM yyyy">
					<reportElement style="Column header" x="2" y="1" width="197" height="20" forecolor="#FFFFFF" uuid="137d38c7-1a83-4fc5-b156-9d5f1b1a0ddc"/>
					<textElement verticalAlignment="Middle">
						<font size="10" isBold="false"/>
					</textElement>
					<textFieldExpression><![CDATA[new java.util.Date()]]></textFieldExpression>
				</textField>
			</frame>
		</band>
	</pageFooter>
	<summary>
		<band splitType="Stretch"/>
	</summary>
</jasperReport>

```
## embed mysql query in Cherry.jrxml report template file
```
SELECT * FROM CARS
```

## database 

```
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for CARS
-- ----------------------------
DROP TABLE IF EXISTS `CARS`;
CREATE TABLE `CARS`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `PRICE` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of CARS
-- ----------------------------
INSERT INTO `CARS` VALUES (1, 'Audi', 52642);
INSERT INTO `CARS` VALUES (2, 'Mercedes', 57127);
INSERT INTO `CARS` VALUES (3, 'Skoda', 9000);
INSERT INTO `CARS` VALUES (4, 'Volvo', 29000);
INSERT INTO `CARS` VALUES (5, 'Bentley', 350000);
INSERT INTO `CARS` VALUES (6, 'Citroen', 21000);
INSERT INTO `CARS` VALUES (7, 'Hummer', 41400);
INSERT INTO `CARS` VALUES (8, 'Volkswagen', 21600);

SET FOREIGN_KEY_CHECKS = 1;

```
