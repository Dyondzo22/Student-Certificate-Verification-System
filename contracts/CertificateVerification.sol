// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract CertificateVerification {

    struct Certificate {
        string studentName;
        string course;
        string institution;
        uint256 issueDate;
    }

    mapping(string => Certificate) public certificates;

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
            block.timestamp
        );
    }

    function verifyCertificate(string memory certificateId)
        public
        view
        returns (
            string memory,
            string memory,
            string memory,
            uint256
        )
    {
        Certificate memory cert = certificates[certificateId];

        return (
            cert.studentName,
            cert.course,
            cert.institution,
            cert.issueDate
        );
    }
}