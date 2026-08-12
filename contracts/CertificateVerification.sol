// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract CertificateVerification {

    struct Certificate {
        string studentName;
        string course;
        string institution;
        uint256 issueDate;
        address issuer;
    }

    mapping(string => Certificate) public certificates;
        event CertificateIssued(
        string certificateId,
        string studentName,
        string course,
        string institution,
        address issuer,
        uint256 issueDate
    );
    function issueCertificate(
    string memory certificateId,
    string memory studentName,
    string memory course,
    string memory institution
) public {
    certificates[certificateId] = Certificate(
        studentName,
        course,
        institution,
        block.timestamp,
        msg.sender
    );

    emit CertificateIssued(
        certificateId,
        studentName,
        course,
        institution,
        msg.sender,
        block.timestamp
    );
}
         
    function verifyCertificate(string memory certificateId)
    public
    view
    returns (
        string memory studentName,
        string memory course,
        string memory institution,
        uint256 issueDate,
        address issuer
    )
{
    Certificate memory certificate = certificates[certificateId];

    return (
        certificate.studentName,
        certificate.course,
        certificate.institution,
        certificate.issueDate,
        certificate.issuer
    );
}
    